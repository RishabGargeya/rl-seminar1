#http://gym.openai.com/docs/
import gym
env = gym.make('CartPole-v0')
env = gym.wrappers.Monitor(env, './vidsrandom/', video_callable= lambda episode_id:True ,force=True)
env.reset()
print(env.action_space)
print(env.observation_space)
for i_episode in range(20): # 20 trials
    observation = env.reset()
    for t in range(100): # maximum 100 iterations
        env.render()
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        print(observation, reward, done, info)

        if done:
            print("Episode finished after {} timesteps".format(t+1))
            break

print("got here")
