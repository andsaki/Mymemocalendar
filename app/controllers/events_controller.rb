class EventsController < ApplicationController
    def index
        if params[:num].nil? then
            @day = Date.today
        elsif params[:num] == '-6' then
            @day = Date.today.months_ago(6)
        elsif params[:num] == '-5' then
            @day = Date.today.months_ago(5)
        elsif params[:num] == '-4' then
            @day = Date.today.months_ago(4)
        elsif params[:num] == '-3' then
            @day = Date.today.months_ago(3)
        elsif params[:num] == '-2' then
            @day = Date.today.months_ago(2)
        elsif params[:num] == '-1' then
            @day = Date.today.last_month
        elsif params[:num] == '0' then
            @day = Date.today
        elsif params[:num] == '1' then
            @day = Date.today.next_month
        elsif params[:num] == '2' then
            @day = Date.today.months_since(2)
        elsif params[:num] == '3' then
            @day = Date.today.months_since(3)
        elsif params[:num] == '4' then
            @day = Date.today.months_since(4)
        elsif params[:num] == '5' then
            @day = Date.today.months_since(5)
        else
            @day = Date.today
        end
        @events = Event.where("group_id = ?")
    end
    
    #def index
        # Postから全てのデータを引っ張りだし、インスタンス変数postsに代入
    #    @year = params[:year]
    #    @month = params[:month]
    #    @day = params[:day]
    #    @events = Event.where("group_id = ?")
    #end
    


    def show
        @event = Event.find_by(year: params[:year],month: params[:month], date: params[:date])
  
    end

    def new
        # 空のPostモデルオブジェクトを生成し、インスタンス変数postsに代入
        @event = Event.new
    end

    def edit
        @event = Event.find_by(year: params[:year], month: params[:month], date: params[:date])
    end

    

    def update
        # Viewから渡されたデータを元にオブジェクトを生成
        @event = Event.find_by(year: params[:year], month: params[:month], date: params[:date])
        if @event.update(event_params)
            # もしDBへの生成したオブジェクトの保存が成功したら/postsへリダイレクト（移動）    
            redirect_to events_index_path
            flash[:notice] = '更新されました！'
        else
            # もしDBへの生成したオブジェクトの保存が成功しなかったら/posts/newへ戻ってnewビューを直させる 
            render action: 'edit'
        end
    end

    def destroy
        # idで指定したオブジェクトを取得
        @event = Event.find_by(year: params[:year],month: params[:month], date: params[:date])
        # オブジェクトの削除
        @event.destroy
        # posts（index）にリダイレクト
        redirect_to events_index_path
        
        
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            # もしDBへの生成したオブジェクトの保存が成功したら/postsへリダイレクト（移動）  
            redirect_to events_index_path
            flash[:notice] = "作成されました！"
        else
            # もしDBへの生成したオブジェクトの保存が成功しなかったら/posts/newへ戻ってnewビューを直させる 
            render action: 'new'
        end
    end
    private
        def event_params
            # submitしたデータのうち、Model作成に必要なものを
            # permitの引数に指定する
            params.require(:event).permit(:year, :month, :date, :title, :content)
        end
end
