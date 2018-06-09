# Lombok #
## Lombok annotations ##
1. Removed boilerplate code

		public class Employee {
			private String firstName;
			private String lastName;
			private String email;

			public static Builder builder() {
				return new Builder();
			}

			public static class Builder {
				private String firstName;
				private String lastName;
				private String email;

				public Builder firstname(String firstName) {
					this.firstName = firstName;
					return this;
				}

				public Builder lastname(String lastName) {
					this.lastName = lastName;
					return this;
				}

				public Builder email(String email) {
					this.email = email;
					return this;
				}

				public Employee build() {
					return new Employee(firstName, lastName, email);
				}
			}
		}

		TO

		@Builder
		@Getter
		@Setter
		@EqualsAndHashCode
		public class Employee {
			private String firstName;
			private String lastName;
			private String email;
		}

2. Other annotations:
	1. `@Getter` - generates getters
	2. `@Setter` - generates setters
	3. `@AllArgsConstructor` - generates constructor with one ar for each field
	4. `@NonNull` - adds validation to ensure a field is not null

			@NonNull
			private String email;

	5. `@EqualsAndHashCode` - generates implementations for `equals()` and `hashCode()`
	6. `@Singular` - node is treated as collection
		1. Generates two adder methods
			1. Add single element to collection
			2. Add all elements of another collection to the collection
		2. Properties guaranteed:
			1. `build()` - makes produced collection immutable
			2. Calling adder or cler does not modify generated objects. Calling build again generates another collection
			3. Collection is compacted to smallest feasible format while remaining efficient
		3. [List of Collection Types Supported By Lombok](https://pastebin.com/raw/Bcmvfg3Y)

## IntelliSense of Lombok ##
1. Lombok assumes name of any collection with `@Singular` on it is an English plural ans will attempt to automatically singularize the name

		@Singular("employee")
		List employees;

## Dependency ##

		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<version>1.16.16</version>
			<scope>provided</scope>
		</dependency>

## Plugin ##
1. Install **Lombok-Plugin** plugin in IDE