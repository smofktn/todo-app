import http from "@/http-common";

class ApiService {
  getAll(): Promise<any> {
    return http.get("/api/todos");
  }

  get(id: any): Promise<any> {
    return http.get(`/api/todos/${id}`);
  }

  create(data: any): Promise<any> {
    return http.post("/api/todos", data);
  }

  update(id: any, data: any): Promise<any> {
    return http.put(`/api/todos/${id}`, data);
  }

  delete(id: any): Promise<any> {
    return http.delete(`/api/todos/${id}`);
  }

  deleteAll(): Promise<any> {
    return http.delete(`/api/todos`);
  }

  findByDescription(title: string): Promise<any> {
    return http.get(`/api/todos?title=${title}`);
  }
}

export default new ApiService();
