TaskForm = React.createClass({
  getInitialState: function() {
    return {
      title: '',
      body: ''
    };
  },
  handleChange: function(e) {
    name = e.target.name;
    return this.setState((
      obj = {},
      obj["" + name] = e.target.value,
      obj
    ));
  },
  valid: function() {
    return this.state.title && this.state.body;
  },
  handleSubmit: function(e) {
    e.preventDefault();
    return $.post('', {
      task: this.state
    }, (function(_this) {
      return function(data) {
        _this.props.handleNewRecord(data);
        return _this.setState(_this.getInitialState());
      };
    })(this), 'JSON');
  },
  render: function() {
    return <form className="form-inline" onSubmit={this.handleSubmit}>
      <div className="form-group">
        <input type="text" className="form-control" placeholder="Title" name="title" value={this.state.title} onChange={this.handleChange} />
      </div>
      <div className="form-group">
        <input type="text" className="form-control" placeholder="Body" name="body" value={this.state.body} onChange={this.handleChange} />
      </div>
      <button type="submit" className="btn btn-primary" disabled={!this.valid()}>Create record</button>
    </form>
  }
});
