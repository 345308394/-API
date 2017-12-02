此api核心函数

def find
  x = params[:x]
  y = params[:y]
  # distance =params[:distance]
  #{distance}
  data = Wzx.where("pt<->point'(#{x},#{y})'<5").order("pt<->point'(#{x},#{y})'").first
  # data1 =(id: data_id)
  render json:data
