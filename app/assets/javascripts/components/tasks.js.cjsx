@Tasks = React.createClass
  getInitialState: ->
    tasks: @props.data

  getDefaultProps: ->
    tasks: []

  addTask: (task) ->
    tasks = React.addons.update(@state.tasks, { $push: [task] })
    @setState tasks: tasks

  deleteTask: (task) ->
    index = @state.tasks.indexOf task
    tasks = React.addons.update(@state.tasks, { $splice: [[index, 1]] })
    @replaceState tasks: tasks

  updateTask: (task, data) ->
    index = @state.tasks.indexOf task
    tasks = React.addons.update(@state.tasks, { $splice: [[index, 1, data]] })
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
            React.createElement Task, key: task.id, task: task, handleDeleteTask: @deleteTask, handleEditTask: @updateTask}
        </tbody>
      </table>
    </div>
