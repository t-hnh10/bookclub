class AuthorsController < ApplicationController
    def index
        @authors = Author.ordered_by_last_name
    end
end
