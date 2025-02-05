package com.example.backend.usecase

import com.example.backend.mapper.TodoMapper
import com.example.backend.entity.Todo
import org.springframework.stereotype.Service

@Service
class GetTodoListUseCase(
    private val todoMapper: TodoMapper
) {
    fun getTodoList(): List<Todo> {
        return todoMapper.getTodoList()
    }
}
