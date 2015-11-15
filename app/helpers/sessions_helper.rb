module SessionsHelper

	def create_session(name)
		session[:alias_id] = name.id
	end

	def destroy_session(name)
		session[:alias_id] = nil
	end

	def current_alias
		Alias.find_by(id: session[:alias_id])
	end
end
