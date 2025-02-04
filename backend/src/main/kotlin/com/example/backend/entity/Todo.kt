package com.example.backend.entity

import java.time.LocalDateTime

data class Todo(
    val id: Long? = null,
    val title: String,
    val deadline: String? = null,
    val isDone: Boolean = false,
    val createdAt: LocalDateTime = LocalDateTime.now(),
    val updatedAt: LocalDateTime = LocalDateTime.now()
)
