Task = React.createClass({
  getInitialState: function() {
    return {
      edit: false
    };
  },
  handleToggle: function(e) {
    e.preventDefault();
    return this.setState({
      edit: !this.state.edit
    });
  },
  handleDelete: function(e) {
    e.preventDefault();
    return $.ajax({
      method: 'DELETE',
      url: "/tasks/" + this.props.task.id,
      dataType: 'JSON',
      success: (function(_this) {
        return function() {
          return _this.props.handleDeleteTask(_this.props.task);
        };
      })(this)
    });
  },
  handleEdit: function(e) {
    var data;
    e.preventDefault();
    data = {
      title: React.findDOMNode(this.refs.title).value,
      body: React.findDOMNode(this.refs.body).value,
    };
    return $.ajax({
      method: 'PUT',
      url: "/tasks/" + this.props.task.id,
      dataType: 'JSON',
      data: {
        task: data
      },
      success: (function(_this) {
        return function(data) {
          _this.setState({
            edit: false
          });
          return _this.props.handleEditTask(_this.props.task, data);
        };
      })(this)
    });
  },
  taskRow: function() {
    return <tr>
      <td>{this.props.task.title}</td>
      <td>{this.props.task.body}</td>
      <td>
        <a className="btn btn-default" onClick={this.handleToggle}>Edit</a>
        <a className="btn btn-danger" onClick={this.handleDelete}>Delete</a>
      </td>
    </tr>
  },
  taskForm: function() {
    return <tr>
      <td>
        <input className="form-control" type="text" defaultValue={this.props.task.title} ref="title" />
      </td>
      <td>
        <input className="form-control" type="text" defaultValue={this.props.task.body} ref="body" />
      </td>
      <td>
        <a className="btn btn-default" onClick={this.handleEdit}>Update</a>
        <a className="btn btn-danger" onClick={this.handleToggle}>Cancel</a>
      </td>
    </tr>
  },
  render: function() {
    if (this.state.edit) {
      return this.taskForm();
    } else {
      return this.taskRow();
    }
  }
});
