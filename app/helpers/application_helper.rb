module ApplicationHelper
  # for all cruds
  def link_to_back path
    link_to path, class: 'btn btn-primary btn-sm', :title => "Voltar" do
      '<i class="glyphicon glyphicon-chevron-left"></i>'.html_safe+I18n.t('views.back')
    end
  end

  def link_to_show path
    link_to '<i class="glyphicon glyphicon-file"></i> '.html_safe+I18n.t('views.show'), path, class: 'btn btn-primary btn-sm', :title => "Exibir"
  end

  def link_to_new path, options = nil
    text = get_text options, 'views.new'
    link_to '<i class="glyphicon glyphicon-plus"></i> '.html_safe+text, path, class: 'btn btn-success btn-sm', :title => "Novo"
  end

  def link_to_edit path, options = nil
    text = get_text options, 'views.edit'
    link_to '<i class="glyphicon glyphicon-pencil"></i> '.html_safe+text, path, class: 'btn btn-primary btn-sm'
  end

  def link_to_delete path
    link_to '<i class="glyphicon glyphicon-remove"></i> '.html_safe+I18n.t('views.destroy'), path, method: :delete, data: { confirm: I18n.t('views.are_you_sure') }, class: 'btn btn-danger btn-sm'
  end

  # for promises
  def link_to_promises manager, options = nil
    text = options && ' '+options[:text]
    link_to '<i class="glyphicon glyphicon-list-alt"></i>'.html_safe+text, manager_promises_path(manager), class: 'btn btn-info btn-sm', :title => "Exibir promessas"
  end

  def link_to_promise_finish promise
    link_to '<i class="glyphicon glyphicon-ok"></i> Finalizar'.html_safe, manager_promise_finish_path(promise.manager, promise), class: 'btn btn-success btn-sm', :title => "Finish" if user_signed_in? && promise.date_finish.nil?
  end

  def link_to_promise_contest promise
    link_to '<i class="glyphicon glyphicon-remove"></i> Contestar'.html_safe, manager_promise_contest_path(promise.manager, promise), class: 'btn btn-danger btn-sm', :title => "Contestar conclusão" if user_signed_in? && !promise.date_finish.nil?
  end

  def link_to_favorite promise
    if user_signed_in?
      # <i class="fa fa-tag" aria-hidden="true"></i>
      isFavorite = promise.isFavorite? current_user
      title = isFavorite ? 'Promessa adicionada as favoritas' : 'Adicionar as promessas favoritas'
      link_to favorite_manager_promise_path(manager_id: promise.manager.id, id: promise.id), method: :post, remote: true, title: title, class: 'btn btn-default btn-sm' do
        if isFavorite
          '<i class="fa fa-bookmark title-2"></i>'.html_safe
        else
          '<i class="fa fa-bookmark-o title-2"></i>'.html_safe
        end
      end
    end
  end


  # for manager
  def link_to_follow manager
    if user_signed_in?
      following = manager.following? current_user
      title = following ? 'Voce está seguindo ' + manager.name : 'Começar a seguir'
      link_to follow_manager_path(id: manager.id), method: :post, remote: true, title: title, class: 'btn btn-default btn-sm' do
        if following
          '<i class="glyphicon glyphicon-star"></i> Seguindo'.html_safe
        else
          '<i class="glyphicon glyphicon-star-empty"></i> Seguir'.html_safe
        end
      end
    end
  end

  private
    def get_text options, index = nil
      (options && options[:show_text] == false) ? '' : ((options && options[:text]) || I18n.t(options && options[:index] || index))
    end
end
