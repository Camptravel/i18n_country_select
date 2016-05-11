module ActionView
  module Helpers
    module FormTagHelper
      include I18nCountrySelect::InstanceTag

      # Creates a dropdown selection box, or if the <tt>:multiple</tt> option is set to true, a
      # multiple choice seletion box.
      #
      #
      # ==== Options
      # * <tt>:multiple</tt> - If set to true, the selection will allow multiple choices.
      # * <tt>:disabled</tt> - If set to true, the user will not be able to use this input.
      # * <tt>:include_blank</tt> - If set to true, an empty option will be created. If set to a string, the string will be used as the option's content and the value will be empty.
      # * <tt>:prompt</tt> - Create a prompt option with blank value and the text asking user to select something.
      # * Any other key creates standard HTML attributes for the tag.
      #
      # ==== Examples
      #   country_code_select_tag 'addr_cc', [[ 'US', 'United States' ], [ 'CA', 'Canada' ]], 'US', class: 'dropdown'
      #   # <select id="addr_cc" name="addr_cc" class="dropdown">
      #   #   <option value="US" selected="selected">United States</option>
      #   #   <option value="CA">Canada</option>
      #   #   <option value="" disabled="disabled">-------------</option>
      #   #   <option>...</option>
      #   # </select>
      #
      def country_code_select_tag(name, priority_countries = nil, selected = nil, options = {})
        option_tags = ''

        if priority_countries
          option_tags += options_for_select(priority_countries, selected)
          option_tags += %(<option value="" disabled="disabled">-------------</option>\n)
        end

        option_tags += options_for_select(country_translations, selected)

        select_tag(name, option_tags, options)
      end
    end
  end
end