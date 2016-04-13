@TaskForm = React.createClass
  getInitialState: ->
    title: ""
    body: ""

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.title && @state.body

  handleSubmit: (e) ->
    e.preventDefault()
    $.post "/tasks", { task: @state }, (data) =>
      @props.handleNewTask data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    <form className="form-inline" onSubmit={@handleSubmit}>
      <div className="form-group">
        <input className="form-control" type="text" placeholder="title" name="title" value={@state.title} onChange={@handleChange} />
      </div>
      <div className="form-group">
        <input className="form-control" type="text" placeholder="body" name="body" value={@state.body} onChange={@handleChange} />
      </div>
      <button className="btn btn-primary" type="submit" disabled={!@valid()}>Create task</button>
    </form>
