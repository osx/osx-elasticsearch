module OSX
  module Elasticsearch
    module Helper
      include Chef::Mixin::ShellOut

      def where_is_elasticsearch
        shell_out('brew --prefix elasticsearch').stdout.chomp
      end
    end
  end
end
