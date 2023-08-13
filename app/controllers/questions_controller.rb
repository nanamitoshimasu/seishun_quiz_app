class QuestionsController < ApplicationController
  def index
    session[:question_ids] = Question.pluck(:id).first(5)
    puts "Question IDs: #{session[:question_ids].inspect}" # デバッグ用の出力
    redirect_to question_path(id: session[:question_ids].first)
  end

  def show
    @question = Question.find(params[:id])
    @current_question_number = session[:question_ids].index(params[:id].to_i) + 1
    @choices = [@question.correct_answer, @question.wrong_answer_1, @question.wrong_answer_2].shuffle
  end

  def answer
    @question = Question.find(params[:id])
    user_answer = params[:answer]

    if user_answer == @question.correct_answer
      next_question_index = session[:question_ids].index(params[:id].to_i) + 1
      if next_question_index < session[:question_ids].size
        flash[:success] = "いいじゃん！やるね！"
        redirect_to question_path(id: session[:question_ids][next_question_index])
      else
        redirect_to result_questions_path
      end
    else
      redirect_to root_path, flash: { danger: 'あらら〜、ざんねん！がんばろう！' }
    end
  end

  def result; end
end
