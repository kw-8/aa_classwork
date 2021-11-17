export const signup = (username, password) => {
  $.ajax({
    method: "POST",
    url: "api/users",
    data: {
      user:{
        username, password
      }
    }
  })
}

export const login = (username, password) => {
  $.ajax({
    method: "POST",
    url: "api/session",
    data: {
      user:{
        username, password
      }
    }
  })
}

export const logout = () => {
  $.ajax({
    method: "DELETE",
    url: "api/session"
  })
}