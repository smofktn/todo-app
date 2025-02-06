<script setup lang="ts">
import { ref } from "vue";
import axios from "axios";
import apiClient from "@/http-common";

const title = ref("");
const deadline = ref<string | undefined>();
const emit = defineEmits(["todo-added"]);

const addTodo = async () => {
  await apiClient.post("/api/v1/todos", {
    title: title.value,
  });
  title.value = "";
  deadline.value = undefined;
  emit("todo-added");
};
</script>

<template>
  <form @submit.prevent="addTodo">
    <input
      v-model="title"
      type="text"
      placeholder="Enter a new todo"
      required
    />
    <input v-model="deadline" type="date" />
    <button type="submit">Add</button>
  </form>
</template>
