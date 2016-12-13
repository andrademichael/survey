class Survey < ActiveRecord::Base
validates(:title, {:presence => true})
before_save(:capitalize_title)


private

  define_method(:capitalize_title) do
    self.title=(title().titleize())
  end
end
