# Swagger #
## Installation ##
1. `sudo npm install -g swagger`

## Swagger Project ##
1. `swagger project create todo-api`
2. `express` framework
3. `cd todo-api`
4. `swagger project start todo-api`
	1. `curl http://127.0.0.1:10010/hello?name=Scott`

## Define API ##
1. `swagger project edit`

## Definitions ##
1. Goto `definitions:`
	
		Todo:
			type: "object"
			properties:
				todo_id:
					type: "integer"
					description: "Id for the todo"
				todo:
					type: "string"
					description: "The todod item"
				datecreated:
					type: "string"
					formate: "date-time"
					description: "Timestamp when the Todo was created. Set by server"
				author:
					type: "string"
					description: "Creator or owner of the todo"
				duedate:
					type: "string"
					format: "date-time"
					description: "When the todo is due"
				completed:
					type: "boolean"
					description: "Indicates if the todo has been completed or not"

2. Change the top portion:

		title: Todo API
		...
		paths:
			/:
				get:
					description: "This endpoint returns all todos avaialable in the database"
					operationId: "GetAllTodos"
					parameters: []
					responses:
						200:
							description: "An array of todos"
							schema:
								type: "array"
								items:
									$ref: "#/definitions/Todo"