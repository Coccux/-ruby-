require 'fox16'
require "../app/view/student_list_view.rb"
require "../models/students_list/students_list.rb"
include Fox

app = FXApp.new
StudentListView.new(app)
app.create
app.run