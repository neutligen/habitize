require 'test_helper'

class ToDoListTest < ActiveSupport::TestCase
 
 def setup
 	@user = users(:michael)
 	@to_do_list = @user.to_do_lists.build(title: "マラソん", category_id: 1, priority_flg: "lite")
 end

 test "正当なリストは認証を通過する" do
 	assert @to_do_list.valid?
 end

 test "ユーザIDがないリストは認証しない" do 
 	@to_do_list.user_id = nil
  assert_not @to_do_list.valid?
 end

 test "タイトルがないリストは認証しない" do
 	@to_do_list.title = nil
 	assert_not @to_do_list.valid?
 end

 test "タイトルは140文字の文字数制限を設定" do
 	@to_do_list.title = "a" * 141
 	assert_not @to_do_list.valid?
 end

 test "現在に近いものから読み出す" do
 	assert_equal to_do_lists(:most_recent), ToDoList.first
 end

 test "ToDoの完了と完了解除" do
 	assert_not @to_do_list.ending_flg
 	@to_do_list.done
 	assert @to_do_list.ending_flg
 	@to_do_list.undone
 	assert_not @to_do_list.ending_flg
 end
end
