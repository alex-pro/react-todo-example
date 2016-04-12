tasksOutput = function(ref) {
  results = [];
  len = ref.length;

  for (i = 0; i < len; i++) {
    task = ref[i];
    results.push(
      React.createElement(Task, {
        key: task.id,
        task: task,
        handleDeleteTask: this.deleteRecord,
        handleEditTask: this.updateRecord
      })
    );
  }
  return results;
};
