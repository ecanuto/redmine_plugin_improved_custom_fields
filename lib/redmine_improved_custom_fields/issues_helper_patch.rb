module RedmineImprovedIssuesHelperPatch
  module IssuesHelperPatch
    unloadable
    
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :render_custom_fields_rows, :improvements
      end
    end
    
    module InstanceMethods
      def render_custom_fields_rows_with_improvements(issue)
        values = issue.visible_custom_field_values(User.current)
        return if values.empty?
        
        l = ""
        r = ""
        s = "<tr>\n"
        n = 0
        last_multi_column = false
        values.compact.each do |value|
          if value.custom_field.multi_column?
            s << build_non_multi_column(l,r)  if l != ""
            l = ""
            r = ""
            s << "<hr />\n" if value.custom_field.section_break?
            s << "<div class='wiki'>\n"
            s << "<p><strong>#{ h(value.custom_field.name) }</strong></p>\n"
            s << "<p>#{ simple_format_without_paragraph(h(show_field(value))) }</p>\n"
            s << "</div>"
            n = 0
          else
            if value.custom_field.section_break?
              s << build_non_multi_column(l,r)  if l != ""
              l = ""
              r = ""
              s << "<hr />\n"
            end
            l << "<div class=\"status attribute\"><div class=\"label\">"+h(value.custom_field.name)+"</div><div class=\"value\">"+h(show_field(value))+"</div></div>" if n % 2  == 0
            r << "<div class=\"status attribute\"><div class=\"label\">"+h(value.custom_field.name)+"</div><div class=\"value\">"+h(show_field(value))+"</div></div>" if n % 2  > 0
            n += 1
          end
          last_multi_column = value.custom_field.multi_column?
        end
        s << build_non_multi_column(l,r)  if l != "" and not last_multi_column
        s.html_safe
      end

      def build_non_multi_column(left, right)
        string = ""
        string << "<div class=\"splitcontent\"><div class=\"splitcontentleft\">"
        string << left
        string << '</div><div class="splitcontentleft">'
        string << right
        string << "</div></div>"
        return string
      end

      def show_field(field)
        output_mask = field.custom_field.output_mask
        if output_mask.nil? || output_mask.empty?
          show_value(field)
        else
          sprintf output_mask, field.value
        end
      rescue StandardError, SyntaxError
        show_value(field)
      end
      
      def next_multi_column_index(issue, index, custom_field_values)
        next_index = index
        while ((next_index < custom_field_values.size) && !custom_field_values[next_index].custom_field.multi_column?) do
          next_index += 1
        end
        return next_index
      end
      
    end
    
  end
end

IssuesHelper.send(:include, RedmineImprovedIssuesHelperPatch::IssuesHelperPatch)
