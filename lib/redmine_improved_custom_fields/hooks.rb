module RedmineImprovedCustomFields
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_custom_fields_form_upper_box, :partial => 'custom_fields/view_custom_fields_form_upper_box'
  end
end
