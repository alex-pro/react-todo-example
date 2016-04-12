Tasks = React.createClass({
  getInitialState: function() {
    return {
      tasks: this.props.data
    };
  },
  getDefaultProps: function() {
    return {
      tasks: []
    };
  },
  addRecord: function(record) {
    tasks = React.addons.update(this.state.tasks, {
      $push: [task]
    });
    this.setState({
      tasks: tasks
    });
  },
  deleteRecord: function(record) {
    index = this.state.tasks.indexOf(task);
    tasks = React.addons.update(this.state.tasks, {
      $splice: [[index, 1]]
    });
    this.replaceState({
      tasks: tasks
    });
  },
  updateRecord: function(task, data) {
    index = this.state.tasks.indexOf(task);
    tasks = React.addons.update(this.state.tasks, {
      $splice: [[index, 1, data]]
    });
    this.replaceState({
      tasks: tasks
    });
  },
  render: function() {
    return <div className="tasks">
      <h2 className="title"> Tasks </h2>
      {React.createElement(TaskForm, handleNewRecord=this.addRecord)}
      <hr />
      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Title</th>
            <th>Body</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {tasksOutput(this.state.tasks)}
        </tbody>
      </table>
    </div>;
  }
});
