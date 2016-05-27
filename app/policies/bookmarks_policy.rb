class BookmarkPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    user.present && (record.user == user)
  end

end
