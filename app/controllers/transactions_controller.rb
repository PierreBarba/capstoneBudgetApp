class TransactionsController < ApplicationController

    def new
        @current_user = current_user
        @transaction = Transaction.new
        @groups = current_user.groups
      end
end
