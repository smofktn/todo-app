package com.example.backend.usecase

import com.example.backend.i_mapper.TodoMapper
import org.springframework.stereotype.Service

@Service
class DeleteTodoUseCase(
    private val todoMapper: TodoMapper
) {
    fun deleteTodoList(id: Long): Unit {
        return todoMapper.deleteTodo(id)
    }
}
