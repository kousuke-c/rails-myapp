class SchedulesController < ApplicationController
  
  def index
   @plan=Schedule.all#planテーブルのデータ取得
   
  end
  
  def new
     @plan = Schedule.new
    
  end
  
    def create
      @plan = Schedule.new(plan_params)
      
       if @plan.save
         flash[:notice] = "ユーザーを新規登録しました"
         redirect_to "/"
       else
           render "new"
       end
        
    end
     def show
      @plan = Schedule.find(params[:id])
     end
    
    def edit
         @plan = Schedule.find(params[:id])
    end 
    
     def update
      @plan = Schedule.find(params[:id])
      if @plan.update(params.require(:plan).permit(:title, :start,:dayAll, :end, :memo))
        flash[:notice] = "「#{@plan.id}番の#{@plan.title}」の情報を更新しました"
        redirect_to "/"
      else
        render "edit"
      end
     end   
    
    def destroy
         @plan = Schedule.find(params[:id])
      @plan.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to "/"
    end
    
    protect_from_forgery
    
    private
    
    def plan_params
        params.permit(:title, :start, :end,:dayAll,:memo)
        #params.require(:plan)はplan.newで定義しているので不要
        #（もともとplanテーブルに保存されるものとして送信されているので
        #params.require(:plan)と書くとだぶる？）
    end
    
   
    
end
