package com.example.backend.usecase

import com.example.backend.mapper.TodoMapper
import org.springframework.stereotype.Service

@Service
class DeleteTodoUseCase(
    private val todoMapper: TodoMapper
) {
    fun deleteTodoList(id: Long): Unit {
        todoMapper.deleteTodo(id)
    }
}
