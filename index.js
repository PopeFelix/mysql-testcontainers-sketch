const { createPool } = require('mysql2/promise')
const { GenericContainer, Wait } = require('testcontainers')
const mysqlContainer = async () => {
  const container = await new GenericContainer('mysql', '5.7')
    .withExposedPorts(3306)
    .withEnv('MYSQL_ALLOW_EMPTY_PASSWORD', '1')
    .withEnv('MYSQL_DATABASE', 'testdb')
    .start()
  console.log('Container started')
  return container
}

(async () => {
  const container = await mysqlContainer()
  try {
    const connection = await createPool({ host: container.getContainerIpAddress(), user: 'root', password: '', port: container.getMappedPort(3306) })
    let constructorName = connection.constructor.name 
    console.log(`Constructor: ${connection.constructor.name}`)
    if (!'escape' in connection) {
      console.log('no escape')
      let c = await connection.getConnection()
      console.log('Create connection')
      if (!c.hasOwnProperty('escape')) {
        console.log(`escape not a property on ${connection.constructor.name}`)
      } else { 
        console.log(`escape is a property on ${connection.constructor.name}`)
      }
    } else { 
        console.log(`escape is a property on ${connection.constructor.name}`)
      }
 
    console.log('Connected to database')
    const result = await connection.query('SELECT table_name, table_schema FROM information_schema.tables') 
    console.log({result: result[0]})
  } catch (e) {
    console.error(e, e.stack)
  }
  await container.stop()
})()
