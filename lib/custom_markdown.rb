require 'middleman-core/renderers/redcarpet'
require 'yaml'

class CustomMarkdown < Middleman::Renderers::MiddlemanRedcarpetHTML

  def initialize(options={})
    super options.merge(
        :with_toc_data => true,
    )
  end

  def loadYaml(fileName)
    basePath = "#{File.dirname(__FILE__)}/../source/includes/data/"
    YAML.load_file("#{basePath}#{fileName}.yaml")
  end

  def preprocess(document)

    # We need this renderer to force render of content within our multi-line markdown elements
    # Note this is the same config used in config.rb for the generic middleman renderer
    r = Redcarpet::Markdown.new(self, options = {
        :markdown => true,
        :fenced_code_blocks           => true,
        :no_intra_emphasis            => true,
        :tables                       => true,
        :autolink                     => true,
        :disable_indented_code_blocks => true,
        :quote                        => true,
        :lax_spacing                  => true
    })

    # Render all of our custom markdown elements
    rendered_doc = custom_object_attributes(document, r)
    rendered_doc = custom_endpoint(rendered_doc, r)
  end

  def custom_object_attributes(document, renderer)
    #document.gsub(/^\[\[(.*?)\n(.*?)\n([^\n]*?)\]\]/m) do
    document.gsub(/^\[\[object#(.*?)\]\]/m) do
      objectName = $1
      all_data = loadYaml(objectName)
      obj_structure = all_data['object']['example']

      resp = "
## #{objectName} object

> Example #{objectName} object

```json
#{obj_structure}
```

<table class=\"object-attributes\">"

      all_data['object']['attributes'].each do |attr_item|
        attr_item.each do |attr_name, attr_data|
          resp += "<tr>
                     <td class=\"property_name\">
                        <span class=\"name\">#{attr_name}</span>
                        <span class=\"type\">#{attr_data['type']}</span>
                     </td>
                     <td class=\"property_desc\">
                        #{renderer.render(attr_data['description'])}
                     </td>
                   </tr>"
        end
      end
      resp += "</table>\n\n"
      resp
    end
  end

  def custom_endpoint(document, renderer)
    document.gsub(/^\[\[endpoint#(.*?)#(.*?)\]\]/m) do
      objectName = $1
      endpoint = $2
      all_data = loadYaml(objectName)
      obj_data = all_data['object'][endpoint]

      # <span>#{attr_data['type']}</span>
      example_req = obj_data['example_request']['shell']
      example_resp = obj_data['example_response']['json']

      resp = renderer.render(
"

> Example request

```shell
#{example_req}
```

> Example response

```json
#{example_resp}
```

### Endpoint

<span class=\"endpoint_method\">#{obj_data['method']}</span> <span class=\"endpoint_url\">#{obj_data['endpoint']}</span>")

      if obj_data.key?('path_parameters') then
        resp += render_params(obj_data['path_parameters'], 'Path parameters', renderer)
      end

      if obj_data.key?('query_parameters') then
        resp += render_params(obj_data['query_parameters'], 'Query parameters', renderer)
      end

      if obj_data.key?('parameters') then
        resp += render_params(obj_data['parameters'], 'Request parameters', renderer)
      end

      resp
    end
  end

  def render_params(params, name, renderer)
    resp = "\n<h3 class=\"parameters\">#{name}</h3>\n"

    resp += "<table class=\"object-attributes\">\n"
    params.each do |attr_item|
      attr_item.each do |attr_name, attr_data|
        optional =
            if attr_data.key?('required') then
              '<span class="required">required</span>'
            else
              '<span class="optional">optional</span>'
            end

        resp += "<tr>
                     <td class=\"property_name\">
                         <span class=\"name\">#{attr_name}</span>
                         #{optional}
                     </td>
                     <td class=\"property_desc\">#{renderer.render(attr_data['description'])}</td>
                   </tr>"
      end
    end
    resp += "</table>\n\n"
  end

end
