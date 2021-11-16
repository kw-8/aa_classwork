import { $CombinedState } from "redux"

export const postUser = user => {
  $.ajax({
    url: '/api/users',
    method: 'post',
    data: { user }, // returned with key user
  })
}

export const postSession = session => {
  $.ajax({
    url: '/api/session',
    method: 'post',
    data: { user }, // returned with key user
  })
}

export const deleteSession = session => {
  $.ajax({
    url: '/api/session',
    method: 'delete', // no data necessary
  })
}