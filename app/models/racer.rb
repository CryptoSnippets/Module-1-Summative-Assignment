class Racer
  include Mongoid::Document
  
  # convenience method for access to client in console
  def self.mongo_client
  	Mongoid::Clients.default
  end
  
  # convenience method for access to racers collection
  def self.collection
  	self.mongo_client['racers']
  end

  def self.all(prototype={}, sort={:number=>1}, skip=0, limit=nil)
  	all = self.collection
					  	.find(prototype)
					  	.sort(sort)
					  	.skip(skip)
  	all = all.limit(limit) if !limit.nil?
  	return all
  end
end

