module NavigationHelpers

  def path_to(page_name)
    case page_name

      when /^the home\s?page$/
        '/'

      when /^the edit user page$/
        edit_user_path(@user)

      when /^the edit (.*) page$/
        page_name =~ /^the edit (.*) page$/
        path_components = $1.split(/\s+/)
        resource = instance_variable_get("@#{path_components.join('_')}")
        self.send(path_components.unshift('edit').push('path').join('_').to_sym, resource)

      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)

          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)
