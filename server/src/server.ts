import express, {response, request} from 'express'
import cors from 'cors'

import { PrismaClient } from '@prisma/client'

interface Id {
    id: number
}


const app = express()

app.use(express.json())
app.use(cors())


const prisma = new PrismaClient({
    log: ['query']
})

// Usuarios ROUTES

app.get('/usuarios', async (request, response) => {
    const usuarios = await prisma.usuario.findMany(
        {select:{
            id: true,
            username: true,
            senha: true,
            url_avatar: true,
            status: true
        }}
    )
    return response.json(usuarios)
})

app.get('/usuario/:id', async (request, response) => {
    
    const id = request.params.id
    const user_id = parseInt(id)

    const usuario = await prisma.usuario.findUnique(
        {
            select:{
                id: true,
                username: true,
                senha: true,
                url_avatar: true,
                status: true
            }
            ,
            where:{
                id:user_id,
            }
        }
    )

    return response.json(usuario)
})

app.get('/user-name/:username',async (request, response) => {
    const username = request.params.username
    const usuario = await prisma.usuario.findUnique(
        {
            select: {
                id: true,
                username: true,
                senha: true,
                status: true,
                url_avatar: true
            },
            where: {
                username: username
            }
        }
    )

    return response.json(usuario)
})

app.post('/logar',async (request, response) => {

    const body = request.body.username
    console.log(body.username);

    const usuario = await prisma.usuario.findUnique(
        {
            select:{
                username:true,
                senha:true
            },
            where:{
                username: body.username
            }
        }
    )


    if (body.password == usuario?.senha)
        {return response.json(true)}
    else {return response.json(false)}
})

// Cliente ROUTES

app.get('/clientes',async (request, response) => {
    const clientes = await prisma.cliente.findMany(
        {
            select:{
                id:true,
                user:true,
                nome: true,
                telefone: true,
                status:true
            }
        }
    )

    return response.json(clientes)
})

app.get('/cliente/:id',async (request, response) => {
    const id = request.params.id
    const client_id = parseInt(id)

    const cliente = await prisma.cliente.findUnique(
        {
            select:{
                id:true,
                user:true,
                nome: true,
                telefone: true,
                status:true
            },
            where:{
                id: client_id
            }
        }
    )

    return response.json(cliente)
})

app.get('/client-user/:username', async (request, response) => {
    const _username = request.params.username
    const user = await prisma.usuario.findUnique(
        {   
            select:{
                id:true
            },
            where: {
                username: _username
            }       
        }
    )

    const user_id = user?.id.valueOf()
    const client = await prisma.cliente.findMany(
        {
            select:{
                id:true,
                nome:true,
                status:true,
                telefone:true,
                user:true,
            },
            where:{
                user_id:user_id
            }
        }
    )
    return response.json(client)
})

// Barbearia ROUTES

app.get('/barbearias', async (request, response) =>{
    const barbearias = await prisma.barbearia.findMany({
        select:{
            id: true,
            nome: true,
            user: true,
            whatsapp:true,
            local:true,
            horarios:true
        }
    })

    return response.json(barbearias)
})

app.get('/barber-user/:username',async (request, response) => {

    const _username = request.params.username
    const user = await prisma.usuario.findUnique(
        {
            select:{
                id:true,
            },
            where:{
                username:_username
            }
        }
    )

    const user_id = user?.id.valueOf()
    const barber = await prisma.barbearia.findMany(
        {
            select:{
                id:true,
                nome:true,
                horarios:true,
                local:true,
                whatsapp:true,
                user:true,
            }, where:{
                user_id:user_id
            }
        }
    )

    return response.json(barber)
    
})

// Atividade ROUTES

app.get('/atividades', async (request, response) =>{
    const atividades = await prisma.atividade.findMany(
        {
            select:{
                barbearia: true,
                cliente: true,
                data_atv: true
            }
        }
    )

    return response.json(atividades)
})

app.get('/historico-cliente/:id',async (request, response) => {
    const client_id = parseInt(request.params.id)
    const history = await prisma.atividade.findMany({
        select:{
            barbearia: true,
            data_atv:true
        },
        where:{
            cliente_id: client_id
        }
    })

    return response.json(history)
})

app.get('/historico-barbearia/:id', async (request, response) => {
    const barbearia_id = parseInt(request.params.id)
    const history = await prisma.atividade.findMany({
        select:{
            cliente: true,
            data_atv: true
        },
        where:{
            barbearia_id: barbearia_id
        }
    })

    return response.json(history)
})

app.listen(3333)