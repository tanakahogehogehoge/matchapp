module MypownersHelper
  def owner_choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_mypowners_path
    elsif action_name == 'edit'
      mypowner_path
    end
  end
end
