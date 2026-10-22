# gdb cheatsheet

```bash
g++ -g -O0 main.cpp -o app   # compilar con símbolos
gdb ./app                    # abrir
gdb --args ./app a b         # con argumentos
gdb -p <PID>                 # a un proceso vivo
```

## Correr
| Cmd | Ab. | Hace |
|---|---|---|
| `run` | `r` | ejecutar |
| `start` | | break temporal en main + run |
| `continue` | `c` | hasta el siguiente breakpoint |
| `quit` | `q` | salir |

## Breakpoints
| Cmd | Ab. | Hace |
|---|---|---|
| `break f` / `file.cpp:42` | `b` | poner |
| `b file.cpp:42 if i==5` | | condicional |
| `tbreak` | `tb` | temporal |
| `info breakpoints` | `i b` | listar |
| `delete N` | `d` | borrar |
| `disable` / `enable` | `dis` / `en` | apagar / prender |

## Avanzar
| Cmd | Ab. | Hace |
|---|---|---|
| `next` | `n` | línea, sin entrar |
| `step` | `s` | línea, entrando |
| `finish` | `fin` | salir de la función |
| Enter | | repite el último comando |

## Inspeccionar
| Cmd | Ab. | Hace |
|---|---|---|
| `print x` | `p` | ver variable (`p *ptr`) |
| `info locals` | `i locals` | variables locales |
| `backtrace` | `bt` | pila de llamadas |
| `list` | `l` | ver código |
| `up` / `down` | | subir a quien me llamó / bajar de vuelta (cambia de frame; luego `p`, `info locals` y `l` usan ese frame) |
| `display x` | | mostrar x automáticamente en cada parada |
| `info display` | | listar los displays |
| `undisplay N` | | quitar el display N |
| `watch x` | | parar cuando x cambie |

## TUI
| Atajo | Hace |
|---|---|
| `layout src` / `Ctrl-x a` | código en pantalla (otra vez = salir) |
| `Ctrl-x o` | cambiar foco |
| `Ctrl-l` | redibujar |

## Si no se ve el código
`-g` faltante · `info source` · `directory /ruta`

