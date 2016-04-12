@Tasks = React.createClass
  getInitialState: ->
    tasks: @props.data

  getDefaultProps: ->
    tasks: []

  addTask: (task) ->
    tasks = @state.tasks.slice()
    tasks.push task
    @setState tasks: tasks

  deleteTask: (task) ->
    tasks = @state.tasks.slice()
    index = tasks.indexOf task
    tasks.splice index, 1
    @replaceState tasks: tasks

  render: ->
    <div className="tasks">
      <h2>Create new task</h2>
      {<TaskForm handleNewTask={@addTask} />}
      <hr />
      <table className="table table-striped">
        <thead>
          <tr>
            <th>Title</th>
            <th>Body</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {for task in @state.tasks
            React.createElement Task, key: task.id, task: task, handleDeleteTask: @deleteTask}
        </tbody>
      </table>
    </div>
