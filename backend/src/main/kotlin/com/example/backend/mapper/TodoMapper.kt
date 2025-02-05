package com.example.backend.mapper

import com.example.backend.entity.Todo
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param

@Mapper
interface TodoMapper {

    fun getTodoList(): List<Todo>

    fun insertTodo(todo: Todo): Unit

    fun deleteTodo(@Param("id") id: Long): Unit
}
