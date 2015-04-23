# osx-elasticsearch

This _Chef_ cookbook installs the [Elasticsearch](http://www.elasticsearch.org) search engine on OS X using Homebrew.

All plugins defined as enabled in the attribute `node['osx-elasticsearch']['plugins']` are installed when the default recipe is run. This attribute is a hash where the key is the name of the plugin and the value is a boolean indicating whether or not the plugin should be enabled (e.g., `'mobz/elasticsearch-head' => true`). This enables wrapper cookbooks to disable a default plugin by setting it to `'name' => false`.

## LWRP's

### osx_elasticsearch_plugin

The `osx_elasticsearch_plugin` LWRP can be used to install and uninstall Elasticsearch plugins. `:install` is the default action.

```
osx_elasticsearch_plugin 'mobz/elasticsearch-head'

osx_elasticsearch_plugin 'mobz/elasticsearch-head' do
  action :uninstall
end
```
