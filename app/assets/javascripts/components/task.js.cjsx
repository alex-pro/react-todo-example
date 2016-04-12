@Task = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/tasks/#{ @props.task.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteTask @props.task

  render: ->
    <tr>
      <td>{@props.task.title}</td>
      <td>{@props.task.body}</td>
      <td>
        <a className="btn btn-danger" onClick={@handleDelete}>Delete task</a>
      </td>
    </tr>
