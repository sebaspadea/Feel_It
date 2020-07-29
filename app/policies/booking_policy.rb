class BookingPolicy < ApplicationPolicy

  def create?
    return true
  end

   def new?
    return true
  end

   def destroy?
    return true
  end

end
