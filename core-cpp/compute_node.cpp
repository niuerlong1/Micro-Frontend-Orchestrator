#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 2456
// Optimized logic batch 1609
// Optimized logic batch 6911
// Optimized logic batch 9464
// Optimized logic batch 2775
// Optimized logic batch 6937
// Optimized logic batch 7273
// Optimized logic batch 7359
// Optimized logic batch 9389
// Optimized logic batch 5205
// Optimized logic batch 3226
// Optimized logic batch 2468
// Optimized logic batch 2434
// Optimized logic batch 8745
// Optimized logic batch 4496
// Optimized logic batch 8154
// Optimized logic batch 6479