@Task = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/tasks/#{ @props.task.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteTask @props.task

  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: React.findDOMNode(@refs.title).value
      body: React.findDOMNode(@refs.body).value
    $.ajax
      method: 'PUT'
      url: "/tasks/#{ @props.task.id }"
      dataType: 'JSON'
      data:
        task: data
      success: (data) =>
        @setState edit: false
        @props.handleEditTask @props.task, data

  taskRow: ->
    <tr>
      <td>{@props.task.title}</td>
      <td>{@props.task.body}</td>
      <td>
        <a className="btn btn-default" onClick={@handleToggle}>Edit task</a>
        <a className="btn btn-danger" onClick={@handleDelete}>Delete task</a>
      </td>
    </tr>

  taskForm: ->
    <tr>
      <td>
        <input className="form-control" type="text" defaultValue={@props.task.title} ref="title" />
      </td>
      <td>
        <input className="form-control" type="text" defaultValue={@props.task.body} ref="body" />
      </td>
      <td>
        <a className="btn btn-default" onClick={@handleEdit}>Update task</a>
        <a className="btn btn-danger" onClick={@handleToggle}>Cancel</a>
      </td>
    </tr>

  render: ->
    if @state.edit
      @taskForm()
    else
      @taskRow()
