class CommentsController < ApplicationController
    def destroy
        # idで指定したオブジェクトを取得
        @comment = Comment.find(params[:id])
        # オブジェクトの削除
        @comment.destroy
        # json形式で@commentの内容をcommentとしてViewに渡す
        @post = Post.find(params[:post_id])
        redirect_to post_path(@post)       
end

    def create
        # idで指定したPostオブジェクトをデータベースから取得  
        @post = Post.find(params[:post_id])

        # フォームに入力されたデータをidで指定したPostオブジェクトに
        # 関連するコメントオブジェクトを作成し、データベースに登録
        # .create == (.new + .save)
        @comment = Post.find(params[:post_id]).comments.create(comments_params)

        if @comment.save
            # 指定したポスト表示ページにリダイレクト
            redirect_to post_path(@post)
        # もしデータベースへの保存が成功しなかったら
        else
            # メソッド処理後にクライアントに返すhtmlのテンプレートをshowに指定
            render :template => "posts/show"

        end
    end

    private
        def comments_params
            params.require(:comment).permit(:commenter, :body)
        end
   
end
