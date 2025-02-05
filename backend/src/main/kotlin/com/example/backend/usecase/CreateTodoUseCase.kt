package com.example.backend.usecase

import com.example.backend.entity.Todo
import com.example.backend.i_mapper.TodoMapper
import org.springframework.stereotype.Service

@Service
class CreateTodoUseCase(
    private val todoMapper: TodoMapper
) {
    fun createTodo(todo: Todo): Unit {
        return todoMapper.insertTodo(todo)
    }
}
