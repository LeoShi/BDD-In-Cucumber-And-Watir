class SearchUser < User
   def show
#     puts "@first_name:#{@first_name},age:#{@age}"
      on(GooglePage) do
        puts input.inspect
        input.set("text")
      end
   end
end