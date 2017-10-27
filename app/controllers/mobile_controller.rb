class MobileController < ApplicationController
  def helloworld
    render plain: "내가 만든 첫 서버"
  end

  def hello_json
    myJson = {"result" => TRUE, "message" => "메세지123 변경"}
    render json: myJson
  end

  def hello_json2
    myJson = {"result" => FALSE, "message" => "헬로JSON22"}
    render json: myJson
  end

  def sign_up

    # 만약, 아이디가 이미 등록되어있는 아이디라면
    # 회원가입 실패 메세지를 출력.
    # 그렇지 않은 경우에만 회원가입을 진행

    if User.where(user_id: params[:user_id]).exists?
      # 아이디가 있다 => 이미 등록된 아이디다 => 중복처리.
      myJson = {"result" => FALSE, "message" => "회원가입 실패"}
      render json: myJson
    else
      # 아이디가 없다 => 회원가입 가능

      u = User.new
      u.user_id = params[:user_id]
      u.user_pw = params[:user_pw]
      u.name = params[:name]
      u.gender = params[:gender]
      u.save

      myJson = {"result" => TRUE, "message" => "임시사용자회원가입", "user" => u}
      render json: myJson
    end


  end

  def sign_in
    if User.where(user_id: params[:user_id], user_pw: params[:user_pw]).exists?

      # 로그인한 사용자 정보 첨부.

      u = User.where(user_id: params[:user_id], user_pw: params[:user_pw]).first


      myJson = {"result" => TRUE, "message" => "로그인성공", "user" => u}
      render json: myJson
    else

      myJson = {"result" => FALSE, "message" => "로그인실패"}
      render json: myJson
    end
  end

  def register_post
    p = Post.new
    p.user_id = params[:user_id]
    p.content = params[:text]
    p.save

    myJson = {"result" => TRUE, "message" => "게시글 등록 성공"}
    render json: myJson
  end

end
