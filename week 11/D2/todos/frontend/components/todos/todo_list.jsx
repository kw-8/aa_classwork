import React from 'react';
import TodoListItem from './todo_list_item'

// export default () => <h3>Todo List goes here!</h3>

class TodoList extends React.Component{
  constructor(props){
    super(props);
  }
  render (){
    console.log(this.props)

    console.log(this.props.todos)
    return(
    <div>
      <h3> Todo List goes here!</h3 >
        <ul className = "todoList">
          {this.props.todos.map((item, idx) => <li key={idx}> {item.title}</li> )}
        </ul>
    </div>
    )
  }
}

export default TodoList;
