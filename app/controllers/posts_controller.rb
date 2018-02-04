# coding: utf-8

class PostsController < ApplicationController

    def index
        # Postから全てのデータを引っ張りだし、インスタンス変数postsに代入
        @posts = Post.all
        @events = Event.all
    end



    def show
        # PostモデルのfindメソッドにparamsでURLから受け取ったIDを引数として与え、
        # そのデータが見つかったらインスタンス変数postに代入
        @post = Post.find(params[:id])
        # Postオブジェクトのidと紐付けられているcomments
        @comment = Post.find(params[:id]).comments.build
    end

    def new
        # 空のPostモデルオブジェクトを生成し、インスタンス変数postsに代入
        @post = Post.new
    end

    def edit
        # 指定したオブジェクトの取得
        @post = Post.find(params[:id])
    end

    

    def update
        # Viewから渡されたデータを元にオブジェクトを生成
        @post = Post.find(params[:id])
        if @post.update(post_params)
            # もしDBへの生成したオブジェクトの保存が成功したら/postsへリダイレクト（移動）    
            redirect_to posts_path
            flash[:notice] = '更新されました！'
        else
            # もしDBへの生成したオブジェクトの保存が成功しなかったら/posts/newへ戻ってnewビューを直させる 
            render action: 'edit'
        end
    end

    def destroy
        # idで指定したオブジェクトを取得
        @post = Post.find(params[:id])
        # オブジェクトの削除
        @post.destroy
        # posts（index）にリダイレクト
        redirect_to posts_path
        
        
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            # もしDBへの生成したオブジェクトの保存が成功したら/postsへリダイレクト（移動）  
            redirect_to posts_path
            flash[:notice] = "作成されました！"
        else
            # もしDBへの生成したオブジェクトの保存が成功しなかったら/posts/newへ戻ってnewビューを直させる 
            render action: 'new'
        end
    end
    private
        def post_params
            # submitしたデータのうち、Model作成に必要なものを
            # permitの引数に指定する
            params.require(:post).permit(:title, :content)
        end

    

    



end
