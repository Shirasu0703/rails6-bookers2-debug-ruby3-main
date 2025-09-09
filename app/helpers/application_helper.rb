module ApplicationHelper
  def exclude_partial?
    # トップページは常に非表示
    return true if current_page?(root_path)

    # ログインしている場合は表示(root以外で)
    # →root_path　以外でログインしていれば false になるので表示される

    # ユーザー編集ページの非表示
    return true if controller_name == 'users' && action_name == "edit"

    # 投稿編集ページの非表示
    return true if controller_name == 'books' && action_name == "edit"

    return true if controller_name == 'groups' && action_name == "edit"

    false
  end
end
